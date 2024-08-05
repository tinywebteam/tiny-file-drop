# Tiny File Drop

A tiny file server application for sharing files, built on nginx and svelte


# Things that need ports 

- svelte/vite
- falcon/gunicorn/uvicorn


```sh
npm run dev -- --host --port 44000
```

# Svelte

Some things to note

- we are running svelte's static adapter
- 

## Static Adapter

the `layout.js`

```js
export const prerender = true;
export const trailingSlash = 'always';
```

prerender 


# falcon 

**remember to check workers `-w` count for deployment**

```sh
bash -c "screen -S falcon-chroma-store -m gunicorn -b=0.0.0.0:44001 api:api -w 1 -k uvicorn.workers.UvicornWorker"
```

```sh
screen -S falcon-chroma-store -m gunicorn -b=0.0.0.0:44001 api:api -w 1 -k uvicorn.workers.UvicornWorker
```

```sh
gunicorn -b=0.0.0.0:44001 api:api -w 1 -k uvicorn.workers.UvicornWorker
```


