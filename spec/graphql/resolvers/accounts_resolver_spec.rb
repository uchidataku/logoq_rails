# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::AccountsResolver do
  subject { described_class }

  let!(:account) { create(:account) }
  let!(:accounts) { create_list(:account, 2) }

  describe 'execute' do
    subject(:execute) do
      AppSchema.execute(resolver, context: context, variables: {}).to_h.deep_symbolize_keys
    end
    let(:context) { { current_account: account } }
    let(:resolver) do
      <<-GRAPHQL
      query GetAccounts {
        accounts {
          edges {
            node {
              ...AccountDetail
            }
          }           
        }
      }

      fragment AccountDetail on Account {
        id
        firstName
      }
      GRAPHQL
    end

    it 'accountsを取得' do
      res = execute
      expect(res[:data][:accounts][:edges].size).to eq 3
    end
  end
end
