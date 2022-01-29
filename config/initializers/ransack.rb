Ransack.configure do |config|
  config.add_predicate "cont_any_word",
                       arel_predicate: "matches_all",
                       formatter: proc { |v| v.scan(/"(.*?)"|(\S+)/).flatten.compact.map { |t| "%#{t}%" } },
                       validator: proc { |v| v.present? },
                       type: :string
end