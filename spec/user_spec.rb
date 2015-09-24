require 'user'

describe User do

 it { is_expected.to have_property :id   }
 it { is_expected.to have_property :email   }
 it { is_expected.to have_property :created_at   }
 it { is_expected.to validate_uniqueness_of :email }
 it { is_expected.to validate_presence_of :email }
 it { is_expected.to validate_presence_of :password }


end

