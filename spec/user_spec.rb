require 'user'

describe User do

 it { is_expected.to have_property :id   }
 it { is_expected.to have_property :email   }
 it { is_expected.to have_property :password   }
 it { is_expected.to have_property :created_at   }

end

