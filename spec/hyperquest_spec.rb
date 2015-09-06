require 'spec_helper'

describe Hyperquest do
  subject { described_class }
  let(:url) { "http://google.com" }

  describe "#get" do
    it "opens a Hyperquest::Request with get" do
      expect(Hyperquest::Request).to receive(:open).with(:get, url)
      subject.get(url)
    end
  end

  describe "#head" do
    it "opens a Hyperquest::Request with head" do
      expect(Hyperquest::Request).to receive(:open).with(:head, url)
      subject.head(url)
    end
  end
end
