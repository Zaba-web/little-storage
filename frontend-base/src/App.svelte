<script>
  import { Router, Route } from "svelte-routing";
  import Home from "./pages/home.svelte";
  import Login from "./pages/login.svelte";
  import MessagePopup from "./components/ui/popup/message-popup.svelte";
  import Dashboard from "./pages/dashboard.svelte";

  export let url = "";
</script>

<MessagePopup />
<Router {url}>
  <Route path="/" component={Home} />
  <Route path="/login" component={Login} />
  <Route path="/dashboard/*" component={Dashboard} />
</Router>
