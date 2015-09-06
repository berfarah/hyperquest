describe Hyperquest::Response do
  subject { Hyperquest::Request.open(method, data)[data] }
  let(:method) { :head }
  let(:data) { "http://google.com" }

  describe "#uri" do
    subject { super().uri }
    it { is_expected.to eq(data) }
  end

  describe "#content_length" do
    subject { super().content_length }
    it { is_expected.to be -1 }
  end

  describe "#content_type" do
    subject { super().content_type }
    it { is_expected.to match(%r{^text/html}) }
  end

  describe "#status" do
    subject { super().status }
    it { is_expected.to be 200 }
  end

  describe "#error" do
    subject { super().error }
    it { is_expected.to be_empty }
  end

  describe "#success?" do
    subject { super().success? }
    it { is_expected.to be true }
  end

  describe "#failed?" do
    subject { super().failed? }
    it { is_expected.to be false }
  end

  describe "#body" do
    subject { super().body }

    context "with a head request" do
      it { is_expected.to be_empty }
    end

    context "with a get request" do
      let(:method) { :get }
      it { is_expected.not_to be_empty }
    end
  end
end
