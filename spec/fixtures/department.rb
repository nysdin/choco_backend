initial_departments = [
  { name: '文学部' },
  { name: '経済学部' },
  { name: '政治経済学部' },
  { name: '法学部' },
  { name: '商学部' },
  { name: '経営学部' },
  { name: '教育学部' },
  { name: '社会学部' },
  { name: '総合政策学部' },
  { name: '理学部' },
  { name: '医学部' },
  { name: '薬学部' },
  { name: '情報学部' },
  { name: '農学部' },
  { name: '工学部' },
  { name: '理工学部' },
  { name: '建築学部' },
  { name: 'その他' }
]

initial_departments.each.with_index(1) do |hash, index|
  Department.seed do |d|
    d.id = index
    d.name = hash[:name]
  end
end
