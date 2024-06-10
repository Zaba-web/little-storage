<script>
  import FullScreenContainer from "../components/ui/layout/full-screen-contianer.svelte";
  import { __ } from "../utils/transalte";
  import LanguageSwitcher from "../components/ui/forms/language-switcher.svelte";
  import LoginForm from "../components/ui/forms/login-form.svelte";
</script>

<FullScreenContainer bgColor="theme-dark-50">
  <div>
    <div class="flex justify-end mb-4">
      <LanguageSwitcher />
    </div>
    <div class="px-16 py-12 w-96 bg-theme-dark-100">
      <h1 class="text-white font-theme-default font-regular text-xl">
        {__("Welcome Back")}
      </h1>
      <span class="text-theme-gray text-lg font-light">
        {__("Login into your account.")}
      </span>
      <div>
        <LoginForm />
      </div>
    </div>
  </div>
</FullScreenContainer>
