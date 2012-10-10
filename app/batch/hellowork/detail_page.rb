# -*- coding: utf-8 -*-
module Hellowork
  class DetailPage
    ATTRIBUTES = {
      no: '求人番号',
      url: nil,
      kind: '求人情報の種類',
      name: '事業所名',
      address: '所在地',
      tel: '電話番号',
      fax: 'FAX番号',
      business_description: '事業内容',
      job_type: '職種',
      employment_type1: '雇用形態',
      industry: '産業',
      employment_type2: '就業形態',
      employment_term: '雇用期間',
      age_conditions: '年齢',
      age_conditions_reasons: '年齢制限の理由',
      office_hours: '就業時間',
      recess: '休憩時間',
      overtime_work: '時間外',
      office_days_of_week: '週所定労働日数',
      wage: '賃金',
      bonus: '賞与',
      holiday: '休日',
      two_holidays_of_week: '週休二日',
      holidays_of_year: '年間休日数',
      childcare_leave_results: '育児休業取得実績',
      usable_day_care_center: '利用可能な託児所',
      office_address: '就業場所',
      transfer: '転勤',
      employees: '従業員数',
      enrollment_insurance: '加入保険',
      age_limit_system: '定年制',
      reemployment: '再雇用',
      dormitory: '入居可能住宅',
      traveling_by_car: 'マイカー通勤',
      commuting: '通勤手当',
      recruitment_amount: '採用人数',
      job_description: '仕事の内容',
      educational_background: '学歴',
      required_experience: '必要な経験等',
      required_lisences: '必要な免許・資格',
      special_report: '求人条件にかかる特記事項',
      receipted_at: '受理日',
      receipted_by: '有効期限日',
      expires_at: '受理安定所',
    }

    attr_reader :page

    def initialize(page)
      @page = page
    end

    def attributes
      @attributes ||= ATTRIBUTES.inject({}) do |res, (k,v)|
        res[k] = get_data(v) if v
        res
      end
    end

    def get_data(name)
      node = @page.at("//div[contains(@class, 'd-table')]/table//tr/th[.='#{name}']/following-sibling::td")
      node.inner_text.strip if node
    end
  end
end
