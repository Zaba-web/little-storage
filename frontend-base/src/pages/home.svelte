<script>
  import FullScreenContainer from "../components/ui/layout/full-screen-contianer.svelte";
  import { __ } from "../utils/transalte";
  import RegisterForm from "../components/ui/forms/registerForm.svelte";
  import LanguageSwitcher from "../components/ui/forms/language-switcher.svelte";
  import { Link } from "svelte-routing";
</script>

<FullScreenContainer bgColor="theme-dark-50">
  <div>
    <div class="flex justify-end mb-4">
      <LanguageSwitcher />
    </div>
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
    <div class="text-center mt-2">
      <strong class="text-theme-gray text-center font-theme-default font-light"
        >Already a member? <span class="text-white"
          ><Link to="/login">Log in.</Link></span
        ></strong
      >
    </div>
  </div>
</FullScreenContainer>
