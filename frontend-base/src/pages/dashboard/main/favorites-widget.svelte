<script>
  import { __ } from "../../../utils/transalte";
  import { Link } from "svelte-routing";
  import FileItemBig from "../../../components/ui/dashboard/files/file-item-big.svelte";
</script>

<div class="w-5/12">
  <div class="flex justify-between items-center">
    <h2 class="text-white font-theme-default text-3xl">{__("Favorites")}</h2>
    <Link
      to="/dashboard/favorites"
      class="underline text-theme-accent font-theme-default"
      >{__("View all")}</Link
    >
  </div>
  <div class="mt-5 flex justify-between">
    <FileItemBig
      fileId={0}
      fileName="some_test_file.xls"
      fileType="xls"
      bg={true}
    />
    <FileItemBig
      fileId={0}
      fileName="some_test_file.pdf"
      fileType="pdf"
      bg={true}
    />
    <FileItemBig
      fileId={0}
      fileName="some_test_file.xlsx"
      fileType="xlsx"
      bg={true}
    />
  </div>
</div>
