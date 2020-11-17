require 'spec_helper'

describe 'Main navigation bar', type: :feature do
  describe 'change store' do
    shared_examples 'change store not available' do
      it 'does not show currency selector button' do
        expect(page).not_to have_button(id: 'stores-button')
      end

      it 'does not render stores list' do
        expect(page).not_to have_selector('div#stores_list')
      end
    end

    context 'when show_store_currency_selector preference is set to true' do
      let!(:stores) { create_list(:store, stores_number, default_country: create(:country)) }

      before do
        reset_spree_preferences do |config|
          config.show_store_currency_selector = true
        end

        visit spree.root_path
      end

      context 'when there is one supported currency' do
        let(:stores_number) { 0 }

        it_behaves_like 'change store not available'
      end

      context 'when there are more than one supported currencies' do
        let(:stores_number) { 2 }
        let(:first_store) { stores.first }
        let(:first_store_currency_symbol) { ::Money::Currency.find(first_store.default_currency).symbol }
        let(:first_link_name) { "#{first_store.default_country&.name} (#{first_store_currency_symbol})" }
        let(:first_url) { "//#{first_store.url}" }
        let(:second_store) { stores.second }
        let(:second_store_currency_symbol) { ::Money::Currency.find(second_store.default_currency).symbol }
        let(:second_link_name) { "#{second_store.default_country&.name} (#{first_store_currency_symbol})" }
        let(:second_url) { "//#{second_store.url}" }

        it 'shows currency selector button' do
          within('.change-store') { expect(page).to have_button(id: 'stores-button') }
        end

        it 'currency selector button shows a links list to currencies' do
          within('.change-store') { expect(page).to have_link(first_link_name, href: first_url) }
          within('.change-store') { expect(page).to have_link(second_link_name, href: second_url) }
        end
      end
    end

    context 'when show_store_currency_selector preference is set to false' do
      let!(:stores) { create_list(:store, stores_number) }

      before do
        reset_spree_preferences do |config|
          config.show_store_currency_selector = false
        end

        visit spree.root_path
      end

      context 'when there is one supported currency' do
        let(:stores_number) { 0 }

        it_behaves_like 'change store not available'
      end

      context 'when there are more than one supported currencies' do
        let(:stores_number) { 2 }

        it_behaves_like 'change store not available'
      end
    end
  end
end
