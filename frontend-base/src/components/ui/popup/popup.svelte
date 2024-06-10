<script>
  import { createEventDispatcher } from "svelte";
  import { __ } from "../../../utils/transalte";
  import { scale, fade } from "svelte/transition";

  const dispatch = createEventDispatcher();

  export let visible = false;

  const close = () => {
    visible = false;
    dispatch("closed");
  };
</script>

{#if visible}
  <div
    class="h-lvh w-full bg-theme-dark-50 flex justify-center items-center"
    transition:fade
  >
    <div
      class="bg-theme bg-theme-dark-100 drop-shadow-lg p-8 min-w-56"
      transition:scale
    >
      <div>
        <slot />
      </div>
      <div class="mt-5">
        <button type="button" class="button button-regular" on:click={close}
          >{__("Close")}</button
        >
      </div>
    </div>
  </div>
{/if}
