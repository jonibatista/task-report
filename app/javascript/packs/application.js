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

const dom_task_date     = "#task_task_date";
const dom_task_customer = "#task_customer_id";
const dom_task_type     = "#task_task_type_id";
const dom_task_project  = "#task_project_id";

function on_customer_change(){
    const customer_id = $(dom_task_customer).val();
    const task_date = $(dom_task_date).val();
    const previous_selected_option = $(dom_task_project).val();
    const task_project = $(dom_task_project).val();

    $.ajax(`../../tasks/${customer_id}/${task_date}/${task_project}`)
        .done( (dom) => {
            $("#customer-projects").html(dom);
            if($(`${dom_task_project} option[value='${previous_selected_option}']`).length){
                $(dom_task_project).val(previous_selected_option);
            }
            bind_project_selection();
        });
}

function bind_project_selection(){
    $(dom_task_project).on("change", () => {
        $(".task-project-dropdown__description").addClass("hidden");
        const task_project = $(dom_task_project).val()
        $(`#task_project_dropdown_${task_project}`).removeClass("hidden");
    });
}

$(document).on('turbolinks:load', () => {

    $(dom_task_customer).on("change", () => {
        on_customer_change();
    });

    bind_project_selection();

    $(dom_task_type).on("change", () => {
        $(".task-task-type-dropdown__description").addClass("hidden");
        const task_type = $(dom_task_type).val()
        $(`#task_task_type_dropdown_${task_type}`).removeClass("hidden");
    });

    $(dom_task_date).on("change", on_customer_change);
});