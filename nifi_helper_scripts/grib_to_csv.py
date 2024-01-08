import argparse

import numpy as np
import xarray as xr

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--input")
    parser.add_argument("--output")
    args = parser.parse_args()

    longitude = np.linspace(5, 15, 21)
    latitude = np.linspace(45, 55, 21)

    (
        xr.open_dataset(
            args.input,
            engine="cfgrib",
            filter_by_keys={"typeOfLevel": "heightAboveGround", "level": 10},
            indexpath="",
        )
        .drop_vars(["step", "heightAboveGround"])
        .sel(longitude=longitude, latitude=latitude)
        .to_dataframe()
        .reset_index()
        .assign(
            longitude=lambda x: np.where(
                x["longitude"] > 180, x["longitude"] - 360, x["longitude"]
            )
        )
        .to_csv(args.output, index=False, sep=";")
    )
