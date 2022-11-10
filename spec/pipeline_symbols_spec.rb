# frozen_string_literal: true

RSpec.describe PipelineSymbols do
  it "has a version number" do
    expect(PipelineSymbols::VERSION).not_to be nil
  end

  let(:input) { [" a, a ", " b, b "] }

  let(:output) { ["a", "b"] }

  it "pipelines as if symbols were procs" do
    expect(input.map(&:strip >> :split >> :last)).to eq(output)
  end

  it "pipelines with proc and symbol mix" do
    expect(input.map(&:last << Proc.new(&:split) << :strip)).to eq(output)
  end

  it "pipelines with method and symbol mix" do
    class Mirror
      def self.mirror(something)
        something
      end
    end

    expect([1].map(&Mirror.method(:mirror) << :to_s)).to eq(["1"])
  end
end
