SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO





create View [dbo].[frwDelegateMyPendingApprovals] as select * from [frwDelegatePendingApp] WHERE  (DelegatePendingApp_From = SYSTEM_USER) OR
                  ('InnovBaseService' = SYSTEM_USER)


GO
