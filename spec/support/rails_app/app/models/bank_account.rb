class BankAccount
end

CreateBankAccountParams = {
  data: {
    type: 'bank-account',
    attributes: {
      account_number: String,
      details: ComplexObject,
    }
  }
}

UpdateBankAccountParams = {
  data: {
    type: 'bank-account',
    attributes: {
      #miscellaneous: [ Hash, NilClass],
      #identifier:    optional(Integer),
      #list:          array_of(Array)
    }
  }
}
