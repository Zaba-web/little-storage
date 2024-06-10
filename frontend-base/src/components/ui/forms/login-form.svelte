<script>
  import { __ } from "../../../utils/transalte";
  import FormInput from "./form-input.svelte";
  import { validators } from "../../../utils/validator";
  import { MessageStore, createMessage } from "../../../stores/message";
  import { login } from "../../../api/userClient";
  import { navigate } from "svelte-routing";

  let userCreds = {
    email: "",
    password: "",
  };

  const loginAttempt = () => {
    if (userCreds.email.length == 0 || userCreds.password.length == 0) {
      $MessageStore = createMessage(
        __("Invalid Form"),
        __("Please, fill all input fields."),
      );
    } else {
      (async () => {
        const response = await login(userCreds);
        if (response.statusCode != 200) {
          $MessageStore = createMessage(__("Error"), __(response.responseText));
        } else {
          navigate("/dashboard");
        }
      })();
    }
  };
</script>

<form method="POST" on:submit|preventDefault={loginAttempt}>
  <FormInput
    label={__("Email")}
    placeholder={__("Enter your email")}
    type="email"
    id="email"
    validationRules={[validators.minLength(1)]}
    on:value-changed={(e) => (userCreds.email = e.detail.value)}
  />
  <FormInput
    label={__("Password")}
    placeholder={__("Enter your password")}
    type="password"
    id="password"
    validationRules={[validators.minLength(1)]}
    on:value-changed={(e) => (userCreds.password = e.detail.value)}
  />
  <div class="mt-4">
    <button class="button button-accent">{__("Login")}</button>
  </div>
</form>
