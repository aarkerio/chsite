# Chipotle Software (c) 2013-2014 GPLv3

require 'factory_girl'
require 'spec_helper'

describe 'validate Fabricator factories ->' do
  FactoryGirl.factories.each do |factory|
    context "with factory for :#{factory.name} ->" do
      subject { Fabricator.build(factory.name) }

      it "is valid" do
          is_valid = subject.valid?
          is_valid.should be_true, subject.errors.full_messages.join(',')
      end
      it 'should be valid' do
           subject.save
           subject.errors.full_messages.should == []
           subject.should be_valid
      end
    end
  end
end
