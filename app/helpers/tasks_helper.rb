module TasksHelper
  def render_week_picker(date, min)
    lis = []

    tag.ul class: 'tasks__week-pickers' do
      previous_week = date-1.week
      if previous_week > min
        link = link_to '<< Previous', tasks_by_week_path(previous_week.year, previous_week.cweek)
        lis << tag.li(link, class: 'tasks__week-picker')
      end

      lis << tag.li("Week #{@selected_week.strftime('#%V: %B, %Y')}", class: 'tasks__week-picker')

      next_week = date+1.week
      if next_week < DateTime.now.end_of_week
        link = link_to 'Next >>', tasks_by_week_path(next_week.year, next_week.cweek)
        lis << tag.li(link, class: 'tasks__week-picker')
      end

      lis.join.html_safe
    end
  end
end
