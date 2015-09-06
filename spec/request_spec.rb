describe Hyperquest::Request do
  subject { described_class }

  it { is_expected.to respond_to :head }
  it { is_expected.to respond_to :get }

  describe ".open" do
    subject { super().open(method, data) }
    let(:method) { :head }

    context "given an empty string" do
      let(:data) { "" }
      it { is_expected.to eq({}) }
    end

    context "given a url" do
      let(:data) { "http://google.com" }
      it "finds the response via string key" do
        expect(subject[data]).to be_a Hyperquest::Response
      end

      it "has 1 response" do
        expect(subject.length).to be 1
      end
    end

    context "given multiple urls" do
      let(:data) { ["http://google.com", "http://google.com.mx"] }

      it "has keys corresponding to the array" do
        expect(subject.keys).to match_array(data)
      end

      it "returns only Responses" do
        expect(subject.values).to all(be_a Hyperquest::Response)
      end

      it "has 2 responses" do
        expect(subject.length).to be 2
      end
    end
  end
end
