module Admin::DashboardsHelper
  def tag_option_select tag_ids
    return [] unless tag_ids

    Tag.where(id: tag_ids).map {|tag| [tag.name, tag.id]}
  end
end
