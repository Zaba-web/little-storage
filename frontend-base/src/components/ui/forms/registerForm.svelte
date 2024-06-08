<script>
  import { __ } from "../../../utils/transalte";
</script>

<form>
  <div class="w-full">
    <div class="w-full">
      <div class="mt-4 w-full">
        <label
          for="email"
          class="block font-theme-default text-theme-gray font-semibold mb-1"
          >Email</label
        >
        <input
          class="input-field"
          type="email"
          id="email"
          placeholder={__("Enter your email")}
        />
      </div>
      <div class="mt-4 w-full">
        <label
          for="firstName"
          class="block font-theme-default text-theme-gray font-semibold mb-1"
          >First name</label
        >
        <input
          class="input-field"
          type="text"
          id="firstName"
          placeholder={__("Enter your name")}
        />
      </div>
      <div class="mt-4 w-full">
        <label
          for="lastName"
          class="block font-theme-default text-theme-gray font-semibold mb-1"
          >Last name</label
        >
        <input
          class="input-field"
          type="text"
          id="lastName"
          placeholder={__("Enter your surname")}
        />
      </div>
    </div>
    <div class="w-full">
      <div class="mt-4 w-full">
        <label
          for="password"
          class="block font-theme-default text-theme-gray font-semibold mb-1"
          >Last name</label
        >
        <input
          class="input-field"
          type="password"
          id="password"
          placeholder={__("Enter your password")}
        />
      </div>
      <div class="mt-4 w-full">
        <label
          for="password_confirm"
          class="block font-theme-default text-theme-gray font-semibold mb-1"
          >Confirm password</label
        >
        <input
          class="input-field"
          type="password"
          id="password_confirm"
          placeholder={__("Enter your password again")}
        />
      </div>
    </div>
  </div>
</form>
