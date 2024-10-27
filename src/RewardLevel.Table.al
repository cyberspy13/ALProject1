table 50100 "Reward Level"
{
    Caption = 'Reward Level'; //The Caption property sets the text string that displays with the object, control, or other element in the user interface for the current language
    TableType = Normal; //Normal is the default value of the TableType property.
    DataClassification = CustomerContent; //Data classification can be used to adhere to security, compliance, and privacy requirements and processes for collecting, storing, and using someone's personal information.

    fields
    {
        field(1; Level; Text[20]) //If a field has properties, they can be set in between the braces { }.
        {
            Caption = 'Level';
            DataClassification = CustomerContent;
        }

        field(2; "Minimum Reward Points"; Integer)
        {
            Caption = 'Minimum Reward Points';
            DataClassification = CustomerContent;
            MinValue = 0;
            NotBlank = true;

            trigger OnValidate();
            var
                RewardLevel: Record "Reward Level";
                tempPoints: Integer;
            begin
                tempPoints := "Minimum Reward Points";
                RewardLevel.SetRange("Minimum Reward Points", tempPoints);
                if not RewardLevel.IsEmpty() then
                    Error('Minimum Reward Points must be unique');
            end;
        }
    }

    keys
    {
        key(PK; Level)
        {
            Clustered = true;
        }
        key("Minimum Reward Points"; "Minimum Reward Points") { }
    }

    trigger OnInsert();
    begin

        Validate("Minimum Reward Points");
    end;

    trigger OnModify();
    begin
        Validate("Minimum Reward Points");
    end;


}