require_relative "../lib/hexlet_code"

RSpec.describe HexletCode do
  describe ".form_for" do
    subject(:form_for) { HexletCode.form_for("") }
    # 1.
    # HexletCode.form_for user do |f|
    # end
    # <form action="#" method="post"></form>
    it "renders form" do
      expect(form_for).to eq("<form action=\"#\" method=\"post\"></form>")
    end
  end

  context "with class" do
    subject(:form_for) { HexletCode.form_for("", class: "hexlet-form") }
    # 2.
    # HexletCode.form_for user, class: "hexlet-form" do |f|
    # end
    # <form action="#" method="post" class="hexlet-form"></form>
    it "renders form with class" do
      expect(form_for).to eq("<form action=\"#\" method=\"post\" class=\"hexlet-form\"></form>")
    end
  end

  context "with url" do
    subject(:form_for) { HexletCode.form_for("", url: "/profile", class: "hexlet-form") }
    # 3.Если передан ключ url, тогда он будет использован в качестве адреса при отправке формы:
    # HexletCode.form_for user, url: '/profile', class: 'hexlet-form' do |f|
    # end
    # <form action="/profile" method="post" class="hexlet-form"></form>
    it "renders form with class" do
      expect(form_for).to eq("<form action=\"/profile\" method=\"post\" class=\"hexlet-form\"></form>")
    end
  end
end
