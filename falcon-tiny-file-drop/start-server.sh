#!/bin/bash
bash -c "screen -S falcon-chroma-store -m gunicorn -b=0.0.0.0:44001 api:api -w 1 -k uvicorn.workers.UvicornWorker"