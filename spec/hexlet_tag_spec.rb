require_relative "../lib/hexlet_code"

RSpec.describe HexletCode::Tag do
  describe ".build" do
    subject(:tag) { described_class.build("p") }
    it "renders tag" do
      expect(tag).to eq("<p></p>")
    end

    context "with attributes" do
      subject(:tag) { described_class.build("p", class: "link", method: "post") }

      it { is_expected.to eq("<p class=\"link\" method=\"post\"></p>") }
    end

    context "with block" do
      subject(:tag) { described_class.build("div") { "text" } }
      it { is_expected.to eq("<div>text</div>") }
    end

    context "with block and attributes" do
      subject(:tag) { described_class.build("a", href: "https://ya.ru") { "yandex" } }
      it { is_expected.to eq("<a href=\"https://ya.ru\">yandex</a>") }
    end

    context "with nested tag" do
      subject(:tag) { described_class.build("div") { described_class.build("p", class: "paragraph") { "random" } } }

      it { is_expected.to eq("<div><p class=\"paragraph\">random</p></div>") }
    end
  end
end
