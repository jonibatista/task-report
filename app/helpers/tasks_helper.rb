module TasksHelper
  def render_week_picker(date, min)
    params = { controller: 'tasks', action: 'index' }

    lis = []
    tag.ul class: 'tasks__week-pickers' do
      previous_week = date-1.week
      if previous_week > min
        link = link_to '<< Previous', params.merge({ year: previous_week.year, week: previous_week.cweek})
        lis << tag.li(link, class: 'tasks__week-picker')
      end

      lis << tag.li("Week #{@selected_week.strftime('%V %B, %Y')}", class: 'tasks__week-picker')

      next_week = date+1.week
      if next_week < DateTime.now.end_of_week
        link = link_to 'Next >>', params.merge({ year: next_week.year, week: next_week.cweek})
        lis << tag.li(link, class: 'tasks__week-picker')
      end

      lis.join.html_safe
    end
  end
end
