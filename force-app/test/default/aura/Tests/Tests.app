<aura:application extends="force:slds">
    
    <c:BaseTestRunnerCmp testspecs="{!join(',', 
    	$Resource.dreamhouseTests
    )}"/>
    <div aura:id="renderTestComponents" id="renderTestComponents"></div>
</aura:application>
