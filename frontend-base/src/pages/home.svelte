<script>
  import FullScreenContainer from "../components/ui/layout/full-screen-contianer.svelte";
  import { __ } from "../utils/transalte";
  import RegisterForm from "../components/ui/forms/registerForm.svelte";
</script>

<FullScreenContainer bgColor="theme-dark-50">
  <div class="px-16 py-12 w-96 bg-theme-dark-100">
    <h1 class="text-white font-theme-default font-regular text-xl">
      {__("Request Membership")}
    </h1>
    <span class="text-theme-gray text-lg font-light">
      {__("Do you want to join?")}
    </span>
    <div>
      <RegisterForm />
    </div>
  </div>
</FullScreenContainer>
