tableextension 50100 Customer extends Customer
{
    fields
    {
        field(10001; RewardPoint; Integer)
        {
            Caption = 'Reward Points';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
    }
}

