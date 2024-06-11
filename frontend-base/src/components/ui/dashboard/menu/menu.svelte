<script>
  import { Link } from "svelte-routing";
  import Usage from "./usage.svelte";
  import QuickUpload from "./quick-upload.svelte";
  import { logout } from "../../../../api/userClient";
  import { navigate } from "svelte-routing";
  import { __ } from "../../../../utils/transalte";

  import cloudIcon from "../../../../assets/icons/menu/cloud.svg";
  import fileIcon from "../../../../assets/icons/menu/files.svg";
  import sharedIcon from "../../../../assets/icons/menu/shared.svg";
  import recentIcon from "../../../../assets/icons/menu/recent.svg";
  import favIcon from "../../../../assets/icons/menu/favor.svg";
  import tempIcon from "../../../../assets/icons/menu/temp.svg";

  import logoutIcon from "../../../../assets/icons/menu/exit.svg";

  $: menu = [
    { path: "", label: __("Home"), active: true, icon: cloudIcon },
    { path: "/files", label: __("Your files"), active: false, icon: fileIcon },
    { path: "/shared", label: __("Shared"), active: false, icon: sharedIcon },
    { path: "/recent", label: __("Recent"), active: false, icon: recentIcon },
    {
      path: "/favorites",
      label: __("Favorites"),
      active: false,
      icon: favIcon,
    },
    { path: "/temp", label: __("Temporary"), active: false, icon: tempIcon },
  ];

  const changeActiveItem = (id) =>
    menu.map((item, index) =>
      index != id ? (menu[index].active = false) : (menu[index].active = true),
    );

  const logOutFromAccount = () => {
    logout();
    navigate("/");
  };
</script>

<div class="pt-8 pl-16 box-border h-full flex flex-col justify-around">
  <strong class="text-white font-theme-default font-extrabold italic text-xl">
    LittleStorage
  </strong>
  <menu
    class="text-theme-gray font-theme-default box-border font-medium mt-8 h-full"
  >
    {#each menu as item, index}
      <li
        class={"block py-3 pl-3 rounded-lg transition-all mt-2 " +
          (item.active ? "bg-theme-accent" : "hover:bg-theme-dark-50")}
        on:click={() => {
          changeActiveItem(index);
        }}
      >
        <Link to={"/dashboard" + item.path} class="flex items-center gap-3">
          <div class="w-6">
            <img src={item.icon} />
          </div>
          {item.label}
        </Link>
      </li>
    {/each}
  </menu>
  <div class="w-full">
    <Usage />
    <div class="flex justify-center mt-5">
      <QuickUpload />
    </div>
    <div
      class="mt-5 py-4 border-t border-theme-dark-50 flex font-theme-default text-theme-gray gap-2 cursor-pointer"
      on:click={logOutFromAccount}
    >
      <img src={logoutIcon} alt="Exit" />
      {__("Logout")}
    </div>
  </div>
</div>
