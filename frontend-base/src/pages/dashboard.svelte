<script>
  import { Router, Route } from "svelte-routing";
  import Menu from "../components/ui/dashboard/menu/menu.svelte";

  $: url = "";
</script>

<div class="h-lvh w-full bg-theme-dark-100 flex p-4">
  <div class="w-80 bg-red">
    <Menu />
  </div>
  <main class="w-full">
    <Router {url} basepath="dashboard"></Router>
  </main>
</div>
