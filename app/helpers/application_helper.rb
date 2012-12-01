module ApplicationHelper
  def text_to_html str
    raw str.lines.map{|n| n.strip}.join('<br>')
  end
end
