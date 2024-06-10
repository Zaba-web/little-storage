<script>
  $: used = 234.23;
  $: total = 1000;
  $: width = (100 / total) * used;
</script>

<div class="mt-10">
  <div
    class="text-theme-gray font-bold font-theme-default flex justify-between"
  >
    <span class="text-md">{used} GB</span>
    <span> of </span>
    <span class="text-md">{total} GB</span>
  </div>
  <div class="w-full h-3 bg-theme-dark-50 mt-2 drop-shadow-lg">
    <div class="h-full bg-theme-accent" style={`width: ${width}%`}></div>
  </div>
</div>
