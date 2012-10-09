# -*- coding: utf-8 -*-
module Hellowork
  class DetailPage
    ATTRIBUTE_NAMES = [
      '求人番号',
      '求人情報の種類',
      '事業所名',
      '所在地',
      '電話番号',
      'FAX番号',
      '事業内容',
      '職種',
      '雇用形態',
      '産業',
      '就業形態',
      '雇用期間',
      '年齢',
      '年齢制限の理由',
      '就業時間',
      '休憩時間',
      '時間外',
      '週所定労働日数',
      '賃金',
      '賞与',
      '休日',
      '週休二日',
      '年間休日数',
      '育児休業取得実績',
      '利用可能な託児所',
      '就業場所',
      '転勤',
      '従業員数',
      '加入保険',
      '定年制',
      '再雇用',
      '入居可能住宅',
      'マイカー通勤',
      '通勤手当',
      '採用人数',
      '仕事の内容',
      '学歴',
      '必要な経験等',
      '必要な免許・資格',
      '求人条件にかかる特記事項',
      '受理日',
      '有効期限日',
      '受理安定所',
    ]

    def initialize(page)
      @page = page
    end

    def attributes
      @attributes ||= ATTRIBUTE_NAMES.inject({}){|res, n| res[n] = get_data(n); res }
    end

    def get_data(name)
      data_node = @page.at("//div[contains(@class, 'd-table')]/table//tr/th[.='#{name}']/following-sibling::td")
      data_node.inner_text.strip if data_node
    end
  end
end
