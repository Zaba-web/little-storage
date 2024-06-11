<script>
  import { Router, Route } from "svelte-routing";
  import Menu from "../components/ui/dashboard/menu/menu.svelte";
  import Main from "./dashboard/main.svelte";
  import Header from "../components/ui/dashboard/header.svelte";

  $: url = "";
</script>

<div class="h-lvh w-full box-border bg-theme-dark-100 flex p-4">
  <div class="w-96 h-full">
    <Menu />
  </div>
  <main
    class="w-full drop-shadow-lg box-border p-5 pl-10 bg-theme-dark-50 ml-8 overflow-x-auto rounded-lg"
  >
    <Header />
    <div class="box-border py-8">
      <Router {url} basepath="dashboard">
        <Route path="/" component={Main} />
      </Router>
    </div>
  </main>
</div>
