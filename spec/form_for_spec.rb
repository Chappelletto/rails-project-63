require_relative "../lib/hexlet_code"

User = Struct.new(:name, :job, :gender, keyword_init: true)


RSpec.describe HexletCode do
  let(:user) { User.new(name: 'John') }

  it 'generates form tag' do
    form = described_class.form_for(user)
    expect(form).to include('<form action="#" method="post">')
  end

  # it 'includes input fields' do
  #   form = described_class.form_for(user) do |f|
  #     f.input :name
  #   end
  #   expect(form).to include('name="name"')
  # end
end

# RSpec.describe HexletCode do
#   describe ".form_for" do
#     subject(:form_for) { HexletCode.form_for("") }
#     # 1.
#     # HexletCode.form_for user do |f|
#     # end
#     # <form action="#" method="post"></form>
#     it "renders form" do
#       expect(form_for).to eq("<form action=\"#\" method=\"post\"></form>")
#     end
#   end

#   context "with class" do
#     subject(:form_for) { HexletCode.form_for("", class: "hexlet-form") }
#     # 2.
#     # HexletCode.form_for user, class: "hexlet-form" do |f|
#     # end
#     # <form action="#" method="post" class="hexlet-form"></form>
#     it "renders form with class" do
#       expect(form_for).to eq("<form action=\"#\" method=\"post\" class=\"hexlet-form\"></form>")
#     end
#   end

#   context "with url" do
#     subject(:form_for) { HexletCode.form_for("", url: "/profile", class: "hexlet-form") }
#     # 3.Если передан ключ url, тогда он будет использован в качестве адреса при отправке формы:
#     # HexletCode.form_for user, url: '/profile', class: 'hexlet-form' do |f|
#     # end
#     # <form action="/profile" method="post" class="hexlet-form"></form>
#     it "renders form with class" do
#       expect(form_for).to eq("<form action=\"/profile\" method=\"post\" class=\"hexlet-form\"></form>")
#     end
#   end

#   context "with input" do
#     before do
#       @user = User.new name: "rob", job: "hexlet", gender: "m"
#     end

#     subject(:form_for) do
#       HexletCode.form_for @user do |f|
#         f.input :name
#         f.input :job, as: :text
#       end
#     end

#     # 1. HexletCode.form_for user do |f|
#     #   # Проверяет есть ли значение внутри name
#     #   f.input :name
#     #   # Проверяет есть ли значение внутри job
#     #   f.input :job, as: :text
#     # end
#     # Для удобства пример указан с переносами строк. Но реализовывать их необязательно
#     # <form action="#" method="post"><input name="name" type="text" value="rob"><textarea name="job" cols="20" rows="40">hexlet</textarea></form>
#     it "renders form with class" do
#       expect(form_for).to eq("<form action=\"#\" method=\"post\"><input name=\"name\" type=\"text\" value=\"rob\"><textarea name=\"job\" cols=\"20\" " +
#        "rows=\"40\">hexlet</textarea></form>")
#     end
#   end

#   context "with hash last params" do
#     before do
#       @user = User.new name: "rob", job: "hexlet", gender: "m"
#     end

#     subject(:form_for) do
#       HexletCode.form_for @user do |f|
#         f.input :name, class: "user-input"
#         f.input :job, as: :text
#       end
#     end
#     # 2.
#     # HexletCode.form_for user, url: '#' do |f|
#     #   f.input :name, class: 'user-input'
#     #   f.input :job
#     # end

#     # <form action="#" method="post">
#     #   <input name="name" type="text" value="rob" class="user-input">
#     #   <input name="job" type="text" value="hexlet">
#     # </form>

#     it "renders form with class" do
#       expect(form_for).to eq("<form action=\"#\" method=\"post\"><input name=\"name\" type=\"text\" value=\"rob\" class=\"user-input\"><input name=\"job\" " +
#         "type=\"text\" value=\"hexlet\"></form>")
#     end
#   end

#   context "with default value" do
#     before do
#       User = Struct.new(:name, :job, :gender, keyword_init: true)
#       @user = User.new name: "rob", job: "hexlet", gender: "m"
#     end

#     subject(:form_for) do
#       HexletCode.form_for @user do |f|
#         f.input :name, class: "user-input"
#         f.input :job, as: :text
#       end
#     end
#     # 3.
#     # HexletCode.form_for user do |f|
#     #   f.input :job, as: :text
#     # end

#     # # <form action="#" method="post">
#     # #   <textarea name="job" cols="20" rows="40">hexlet</textarea>
#     # # </form>
#     it "renders form with class" do
#       expect(form_for).to eq("<form action=\"#\" method=\"post\"><input name=\"name\" type=\"text\" value=\"rob\" class=\"user-input\"><input name=\"job\" " +
#         "type=\"text\" value=\"hexlet\"></form>")
#     end
#   end

#   context "with new default value" do
#     before do
#       User = Struct.new(:name, :job, :gender, keyword_init: true)
#       @user = User.new name: "rob", job: "hexlet", gender: "m"
#     end

#     subject(:form_for) do
#       HexletCode.form_for @user do |f|
#         f.input :name, class: "user-input"
#         f.input :job, as: :text
#       end
#     end
#     # HexletCode.form_for user, url: '#' do |f|
#     #   f.input :job, as: :text, rows: 50, cols: 50
#     # end
#     # <form action="#" method="post">
#     #   <textarea name="job" cols="50" rows="50">hexlet</textarea>
#     # </form>

#     it "renders form with class" do
#       expect(form_for).to eq("<form action=\"#\" method=\"post\"><input name=\"name\" type=\"text\" value=\"rob\" class=\"user-input\"><input name=\"job\" " +
#         "type=\"text\" value=\"hexlet\"></form>")
#     end
#   end

#   context "when no field - error" do
#     before do
#       User = Struct.new(:name, :job, :gender, keyword_init: true)
#       @user = User.new name: "rob", job: "hexlet", gender: "m"
#     end

#     subject(:form_for) do
#       HexletCode.form_for @user do |f|
#         f.input :name
#         f.input :job, as: :text
#         # Поле age у пользователя нет
#         f.input :age
#       end
#     end

#     it "error" do
#       expect(form_for).to eq("'public_send': undefined method 'age' for #<struct User id=nil, name=nil, job=nil> (NoMethodError)")
#     end
#     # 4.
#     # HexletCode.form_for user, url: '/users' do |f|
#     #   f.input :name
#     #   f.input :job, as: :text
#     #   # Поля age у пользователя нет
#     #   f.input :age
#     # end
#     # =>  `public_send': undefined method `age' for #<struct User id=nil, name=nil, job=nil> (NoMethodError)
#   end
# end
