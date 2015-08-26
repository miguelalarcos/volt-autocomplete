require 'spec_helper'

describe 'sample integration test', type: :feature do
  dawkins = nil
  darwin = nil
  selfish = nil

  before :each do
    dawkins = Author.new({:surname => 'Dawkins'})
    store._authors << dawkins
    store._authors << Author.new({:surname => 'Dennet'})
    darwin = Author.new({:surname => 'Darwin'})
    store._authors << darwin
    book = Book.new({:title => 'The selfish gen.', :author => dawkins, :coauthor => 'Dawkins'})
    store._books << book
    selfish = book
  end

  xit 'should enter A' do
    visit '/'

    find('.first .xautocomplete input').set('A')
    find('.first .xautocomplete input').trigger('focus')
    has = find('.first .xautocomplete').has_selector? '.xautocomplete-popover'
    expect(has).to be_falsey
  end

  xit 'should enter D' do
    visit '/'

    find('.first .xautocomplete input').set('D')
    find('.first .xautocomplete input').trigger('focus')
    has = find('.first .xautocomplete').has_selector? '.xautocomplete-popover'
    expect(has).to be_truthy
  end

  xit 'should enter Darw and click' do
    visit '/'

    find('.first .xautocomplete input').set('Darw')
    find('.first .xautocomplete input').trigger('focus')
    find('.xautocomplete-popover .xitem').trigger('click')

    value = find('.first .xautocomplete input').value
    expect(value).to eq('Darwin')
    has = find('.first .xautocomplete').has_selector? '.xautocomplete-popover'
    expect(has).to be_falsey
    expect(selfish.author.value).to be(darwin)
  end

  xit 'should enter D and click' do
    visit '/'

    find('.first .xautocomplete input').set('D')
    find('.first .xautocomplete input').trigger('focus')
    find('.xautocomplete-popover .xitem.xselected').trigger('click')

    value = find('.first .xautocomplete input').value
    expect(value).to eq('Darwin')
    has = find('.first .xautocomplete').has_selector? '.xautocomplete-popover'
    expect(has).to be_falsey
    expect(selfish.author.value).to be(darwin)
  end

  xit 'should enter A in .second' do
    visit '/'

    find('.second .xautocomplete input').set('A')
    find('.second .xautocomplete input').trigger('focus')
    has = find('.second .xautocomplete').has_selector? '.xautocomplete-popover'

    expect(has).to be_falsey
  end

  xit 'should enter D in .second' do
    visit '/'

    find('.second .xautocomplete input').set('D')
    find('.second .xautocomplete input').trigger('focus')
    has = find('.second .xautocomplete').has_selector? '.xautocomplete-popover'

    expect(has).to be_truthy
  end

  xit 'should enter Darw and click in .second' do
    visit '/'

    find('.second .xautocomplete input').set('Darw')
    find('.second .xautocomplete input').trigger('focus')
    find('.xautocomplete-popover .xitem').trigger('click')

    value = find('.second .xautocomplete input').value
    expect(value).to eq('Darwin')
    has = find('.second .xautocomplete').has_selector? '.xautocomplete-popover'
    expect(has).to be_falsey
    expect(selfish.coauthor).to eq('Darwin')
  end

  it 'should enter D and click in .second' do
    visit '/'

    find('.second .xautocomplete input').set('D')
    find('.second .xautocomplete input').trigger('focus')

    find('.xautocomplete-popover .xitem.xselected').trigger('click')

    expect(store._books.first.coauthor.value).to eq('Darwin')
  end

end
