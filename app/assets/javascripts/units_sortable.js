$(function () {
  $("#sortable").sortable({
    update: function (event, ui) {
      var sortedIDs = $(this).sortable("toArray", { attribute: "data-id" });
      // $.post($("#sortable").data("url"), $(this).sortable("serialize"));
      $.ajax({
        url: $(this).data("url"),
        type: "PATCH", // Use PATCH for updating resources
        data: { unit: sortedIDs }, // Sending the sorted IDs to the server
        headers: {
          "X-CSRF-Token": $('meta[name="csrf-token"]').attr("content"),
        },
        success: function (response) {
          console.log("Order updated successfully.");
        },
        error: function (xhr, status, error) {
          console.error("Error updating order:", error);
        },
      });
    },
  });
  $("#sortable").disableSelection();
});
