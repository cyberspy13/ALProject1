pageextension 50100 "Customer Card" extends "Customer Card"

{
    layout
    {
        addafter("Last Date Modified")
        {
            field(RewardLevel; RewardLevel)
            {
                ApplicationArea = All;
                Caption = 'Reward Level';
                Description = 'Reward level of the customer';
                ToolTip = 'Specifies the level of reward that the customer has at this point.';
                Editable = false;
            }
            field(RewardPoints; RewardPoints)
            {
                ApplicationArea = All;
                Caption = 'Reward Points';
                Description = 'Reward points of the customer';
                ToolTip = 'Specifies the level of reward that the customer has at this point.';
                Editable = false;
            }
        }
    }
    trigger OnAfterGetRecord();
    var
        CustomerRewardsMgtExt: Codeunit "Customer Rewards Ext. Mgt.";
    begin
        // Get the reward level associated with reward points 
        RewardLevel := CustomerRewardsMgtExt.GetRewardLevel(Rec.RewardPoints);
    end;

    var
        RewardLevel: Text;



}