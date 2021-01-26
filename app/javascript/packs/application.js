// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")

function on_customer_change($elem_to_replace, customer_id){
    task_date = $("#task_task_date").val();
    $.ajax(`../../customers/${customer_id}/projects/${task_date}`)
        .done( (dom) => {
            $elem_to_replace.html(dom);
            $elem_to_replace.trigger("change");

            bind_project_selection();
        });
}

function bind_project_selection(){
    const $task_project = $("#task_project_id");
    $task_project.on("change", () => {
        $(".task-project-dropdown__description").addClass("hidden");
        $(`#task_project_dropdown_${$task_project.val()}`).removeClass("hidden");
        const project_id = $task_project.val();
    });
}

$(document).on('turbolinks:load', () => {

    const $task_customer = $("#task_customer_id");
    $task_customer.on("change", () => {
        const customer_id = $task_customer.val();
        const $elem_to_replace = $("#customer-projects");
        on_customer_change($elem_to_replace, customer_id);
    });

    bind_project_selection();

    const $task_type = $("#task_task_type_id");
    $task_type.on("change", () => {
        $(".task-task-type-dropdown__description").addClass("hidden");
        $(`#task_task_type_dropdown_${$task_type.val()}`).removeClass("hidden");
    });

    const $task_date = $("#task_task_date");
    $task_date.on("change", () => {
        $task_customer.trigger("change");
    });
});