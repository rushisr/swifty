<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="SwiftyWebRole" generation="1" functional="0" release="0" Id="1519b6d4-b41d-433e-b3e0-d93c77690dab" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="SwiftyWebRoleGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="SwiftyWCFServiceWebRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/SwiftyWebRole/SwiftyWebRoleGroup/LB:SwiftyWCFServiceWebRole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="SwiftyWCFServiceWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/SwiftyWebRole/SwiftyWebRoleGroup/MapSwiftyWCFServiceWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="SwiftyWCFServiceWebRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/SwiftyWebRole/SwiftyWebRoleGroup/MapSwiftyWCFServiceWebRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:SwiftyWCFServiceWebRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/SwiftyWebRole/SwiftyWebRoleGroup/SwiftyWCFServiceWebRole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapSwiftyWCFServiceWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/SwiftyWebRole/SwiftyWebRoleGroup/SwiftyWCFServiceWebRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapSwiftyWCFServiceWebRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/SwiftyWebRole/SwiftyWebRoleGroup/SwiftyWCFServiceWebRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="SwiftyWCFServiceWebRole" generation="1" functional="0" release="0" software="c:\users\rushisr\documents\visual studio 2012\Projects\SwiftyWebApp\SwiftyWebRole\csx\Release\roles\SwiftyWCFServiceWebRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;SwiftyWCFServiceWebRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;SwiftyWCFServiceWebRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="SwiftyWCFServiceWebRole.svclog" defaultAmount="[1000,1000,1000]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/SwiftyWebRole/SwiftyWebRoleGroup/SwiftyWCFServiceWebRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/SwiftyWebRole/SwiftyWebRoleGroup/SwiftyWCFServiceWebRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/SwiftyWebRole/SwiftyWebRoleGroup/SwiftyWCFServiceWebRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="SwiftyWCFServiceWebRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="SwiftyWCFServiceWebRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="SwiftyWCFServiceWebRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="a9eb8ee6-09fb-482f-9517-7be00713b901" ref="Microsoft.RedDog.Contract\ServiceContract\SwiftyWebRoleContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="76932ba5-5231-48b3-9696-090264be92de" ref="Microsoft.RedDog.Contract\Interface\SwiftyWCFServiceWebRole:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/SwiftyWebRole/SwiftyWebRoleGroup/SwiftyWCFServiceWebRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>