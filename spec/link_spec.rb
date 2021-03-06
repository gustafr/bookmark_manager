require 'link'

describe Link do

  it { is_expected.to have_property :id   }
  it { is_expected.to have_property :title   }
  it { is_expected.to have_property :description   }
  it { is_expected.to have_property :url   }
  it { is_expected.to have_property :created_at   }

end