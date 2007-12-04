require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/classes'

describe "Math.acosh" do
  it "returns a float" do
    Math.acosh(1.0).class.should == Float
  end
  
  it "returns the principle value of the inverse hyperbolic cosine of the argument" do
    Math.acosh(14.2).should_be_close(3.345146999647, TOLERANCE)
    Math.acosh(1.0).should_be_close(0.0, TOLERANCE)
  end
  
  it "it raises Errno::EDOM if x < 1" do
    lambda { Math.acosh(1.0 - TOLERANCE) }.should raise_error(Errno::EDOM)
    lambda { Math.acosh(0) }.should raise_error(Errno::EDOM)
    lambda { Math.acosh(-1.0) }.should raise_error(Errno::EDOM)
  end
  
  it "raises ArgumentError if the argument cannot be coerced with Float()" do
    lambda { Math.acosh("test") }.should raise_error(ArgumentError)
  end

  it "raises a TypeError if the argument is nil" do
    lambda { Math.acosh(nil) }.should raise_error(TypeError)
  end  

  it "accepts any argument that can be coerced with Float()" do
    Math.acosh(MathSpecs::Float.new).should == 0.0
  end
end

describe "Math#acosh" do
  it "is accessible as a private instance method" do
    IncludesMath.new.send(:acosh, 1.0).should_be_close(0.0, TOLERANCE)
  end
end
