<script>
  import { Router, Route } from "svelte-routing";
  import Home from "./pages/home.svelte";

  export let url = "";
</script>

<Router {url}>
  <Route path="/" component={Home} />
</Router>
