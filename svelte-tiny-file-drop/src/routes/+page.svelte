<script>
    import { onMount } from "svelte";

    let files;

    let getAllFiles = GetAllFiles();

    function refreshAllFiles() {
        getAllFiles = GetAllFiles();
    }

    async function GetAllFiles() {
        const response = await fetch(`https://store.chroma.malamute.dev/files`);
        return await response.json();
    }

    async function UploadFiles(data) {
        console.log("trying async upload")
        const response = await fetch("https://store.chroma.malamute.dev/files", {
            method: "POST",
            body: data,
        });
        console.log("async upload complete")
        refreshAllFiles();
    }

    $: if (files) {
        for (const file of files) {    
            console.log(`${file.name}: ${file.size} bytes`);
            let data = new FormData();
            data.append("file", file);
            UploadFiles(data);
        }
        console.log("")
    }

    onMount(() => {});
</script>

<h1>Chromatan Secure Files Portal</h1>
<p>
    <em
        >provided by Malamute</em
    >
</p>
<hr />
<input
    class="file-input"
    bind:files
    type="file"
    name="file"
    id="file"
    accept=""
/>
<hr />

<button on:click={refreshAllFiles}>Resfresh File Store</button>

{#await getAllFiles}
    <p>getting list</p>
{:then response}
    {#each response.response as filename}
        <p class="file">
            <a href="https://store.chroma.malamute.dev/file/{filename}"
                >📩 - {filename}</a
            >
        </p>
    {/each}
{/await}

<style>
    a {
        margin: auto 0 auto 0;
        text-decoration: none;
    }

    .file {
        transition: all 0.3s ease-out;
        margin: 1rem 2rem 0.5rem 1rem;
        padding: 0.5rem;
        border: 1px solid black;
        box-shadow: 5px 2px 2px rgb(194, 194, 194);
        max-width: 80ch;
    }

    .file:hover {
        transition: all 0.3s ease-out;
        margin-left: 0.3rem;
        box-shadow: 8px 6px 6px rgb(194, 194, 194);
    }
</style>
