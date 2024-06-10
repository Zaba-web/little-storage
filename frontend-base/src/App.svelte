<script>
  import { Router, Route } from "svelte-routing";
  import Home from "./pages/home.svelte";
  import MessagePopup from "./components/ui/popup/message-popup.svelte";

  export let url = "";
</script>

<MessagePopup />
<Router {url}>
  <Route path="/" component={Home} />
</Router>
