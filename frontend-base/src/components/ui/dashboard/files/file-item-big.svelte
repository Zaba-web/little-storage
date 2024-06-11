<script>
  import { fileIcons } from "../../../../stores/fileIcons";

  export let fileType;
  export let fileName;
  export let fileId;
  export let bg;

  let icon = $fileIcons[fileType] || $fileIcons["default"];
</script>

<div
  class="w-44 flex flex-col cursor-pointer transition-all hover:drop-shadow-lg hover:bg-theme-dark-75 rounded-xl justify-center gap-2 items-center h-44 box-border p-4 {bg &&
    'bg-theme-dark-100'}"
>
  <img src={icon} alt={fileType} />
  <span
    class="text-theme-gray-dark font-theme-default overflow-hidden block max-w-full break-all max-h-16"
    title={fileName}>{fileName}</span
  >
</div>
