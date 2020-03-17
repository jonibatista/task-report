function on_customer_change($elem_to_replace, customer_id){
    $.ajax(`../../customers/${customer_id}/projects`)
        .done( (dom) => {
            $elem_to_replace.html(dom);
            $elem_to_replace.trigger("change");
        });
}

$(document).on('turbolinks:load', () => {
    const $subject_customer = $("#subject_customer_id");
    $subject_customer.on("change", () => {
        const customer_id = $subject_customer.val()
        const $elem_to_replace = $("#subject_project_id");
        on_customer_change($elem_to_replace, customer_id);
    });

    const $task_customer = $("#task_customer_id");
    $task_customer.on("change", () => {
        const customer_id = $task_customer.val()
        const $elem_to_replace = $("#task_project_id");
        on_customer_change($elem_to_replace, customer_id);
    });

    const $task_project = $("#task_project_id");
    $task_project.on("change", () => {
        const project_id = $task_project.val()
        const $elem_to_replace = $("#task_subject_id");
        $.ajax(`../../projects/${project_id}/subjects`)
            .done( (dom) => {
                $elem_to_replace.html(dom);
            });
    });
});