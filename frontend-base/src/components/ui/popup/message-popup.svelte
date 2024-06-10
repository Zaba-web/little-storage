<script>
  import Popup from "./popup.svelte";
  import { MessageStore, defaultMessageState } from "../../../stores/message";

  const onClose = () => {
    $MessageStore = { ...defaultMessageState };
  };
</script>

<Popup
  visible={$MessageStore.title.length != 0 && $MessageStore.message.length != 0}
  on:closed={onClose}
>
  <h2 class="text-white text-lg font-theme-default font-medium">
    {$MessageStore.title}
  </h2>

  <p class="text-theme-gray font-theme-default">{$MessageStore.message}</p>
</Popup>
